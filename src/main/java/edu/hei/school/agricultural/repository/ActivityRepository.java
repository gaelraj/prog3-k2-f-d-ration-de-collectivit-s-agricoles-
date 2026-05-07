package edu.hei.school.agricultural.repository;

import edu.hei.school.agricultural.entity.ActivityType;
import edu.hei.school.agricultural.entity.CollectivityActivity;
import edu.hei.school.agricultural.entity.MemberOccupation;
import edu.hei.school.agricultural.entity.MonthlyRecurrenceRule;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static java.util.UUID.randomUUID;

@Repository
@RequiredArgsConstructor
public class ActivityRepository {

    private final Connection connection;

    public List<CollectivityActivity> saveAll(List<CollectivityActivity> activities) {
        List<CollectivityActivity> savedActivities = new ArrayList<>();

        String sql = """
                insert into collectivity_activity (
                    id,
                    collectivity_id,
                    label,
                    activity_type,
                    executive_date,
                    recurrence_week_ordinal,
                    recurrence_day_of_week
                )
                values (?, ?, ?, ?, ?, ?, ?)
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (CollectivityActivity activity : activities) {
                ps.setString(1, activity.getId());
                ps.setString(2, activity.getCollectivityId());
                ps.setString(3, activity.getLabel());
                ps.setString(4, activity.getActivityType() == null ? null : activity.getActivityType().name());

                if (activity.getExecutiveDate() == null) {
                    ps.setNull(5, Types.DATE);
                } else {
                    ps.setDate(5, Date.valueOf(activity.getExecutiveDate()));
                }

                MonthlyRecurrenceRule recurrenceRule = activity.getRecurrenceRule();

                if (recurrenceRule == null || recurrenceRule.getWeekOrdinal() == null) {
                    ps.setNull(6, Types.INTEGER);
                } else {
                    ps.setInt(6, recurrenceRule.getWeekOrdinal());
                }

                if (recurrenceRule == null || recurrenceRule.getDayOfWeek() == null) {
                    ps.setNull(7, Types.VARCHAR);
                } else {
                    ps.setString(7, recurrenceRule.getDayOfWeek());
                }

                ps.addBatch();
            }

            ps.executeBatch();

            for (CollectivityActivity activity : activities) {
                saveActivityOccupations(activity);

                CollectivityActivity savedActivity = findById(activity.getId()).orElseThrow();
                savedActivities.add(savedActivity);
            }

            return savedActivities;
        } catch (SQLException e) {
            throw new RuntimeException("Error saving collectivity activities: " + e.getMessage(), e);
        }
    }

    private void saveActivityOccupations(CollectivityActivity activity) {
        if (activity.getMemberOccupationConcerned() == null || activity.getMemberOccupationConcerned().isEmpty()) {
            return;
        }

        String sql = """
                insert into collectivity_activity_occupation (
                    id,
                    activity_id,
                    member_occupation
                )
                values (?, ?, ?)
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (MemberOccupation occupation : activity.getMemberOccupationConcerned()) {
                ps.setString(1, randomUUID().toString());
                ps.setString(2, activity.getId());
                ps.setString(3, occupation.name());
                ps.addBatch();
            }

            ps.executeBatch();
        } catch (SQLException e) {
            throw new RuntimeException("Error saving activity occupations: " + e.getMessage(), e);
        }
    }

    public List<CollectivityActivity> findAllByCollectivityId(String collectivityId) {
        List<CollectivityActivity> activities = new ArrayList<>();

        String sql = """
                select
                    id,
                    collectivity_id,
                    label,
                    activity_type,
                    executive_date,
                    recurrence_week_ordinal,
                    recurrence_day_of_week
                from collectivity_activity
                where collectivity_id = ?
                order by label
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, collectivityId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                activities.add(mapFromResultSet(rs));
            }

            return activities;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding collectivity activities: " + e.getMessage(), e);
        }
    }

    public Optional<CollectivityActivity> findById(String activityId) {
        String sql = """
                select
                    id,
                    collectivity_id,
                    label,
                    activity_type,
                    executive_date,
                    recurrence_week_ordinal,
                    recurrence_day_of_week
                from collectivity_activity
                where id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, activityId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Optional.of(mapFromResultSet(rs));
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Error finding activity by id: " + e.getMessage(), e);
        }
    }

    public Optional<CollectivityActivity> findByCollectivityIdAndActivityId(
            String collectivityId,
            String activityId
    ) {
        String sql = """
                select
                    id,
                    collectivity_id,
                    label,
                    activity_type,
                    executive_date,
                    recurrence_week_ordinal,
                    recurrence_day_of_week
                from collectivity_activity
                where collectivity_id = ?
                and id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, collectivityId);
            ps.setString(2, activityId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Optional.of(mapFromResultSet(rs));
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Error finding activity by collectivity: " + e.getMessage(), e);
        }
    }

    private CollectivityActivity mapFromResultSet(ResultSet rs) throws SQLException {
        LocalDateValue executiveDate = getLocalDateValue(rs, "executive_date");

        MonthlyRecurrenceRule recurrenceRule = null;

        Integer weekOrdinal = rs.getObject("recurrence_week_ordinal") == null
                ? null
                : rs.getInt("recurrence_week_ordinal");

        String dayOfWeek = rs.getString("recurrence_day_of_week");

        if (weekOrdinal != null || dayOfWeek != null) {
            recurrenceRule = MonthlyRecurrenceRule.builder()
                    .weekOrdinal(weekOrdinal)
                    .dayOfWeek(dayOfWeek)
                    .build();
        }

        String activityTypeValue = rs.getString("activity_type");

        return CollectivityActivity.builder()
                .id(rs.getString("id"))
                .collectivityId(rs.getString("collectivity_id"))
                .label(rs.getString("label"))
                .activityType(activityTypeValue == null ? null : ActivityType.valueOf(activityTypeValue))
                .executiveDate(executiveDate.value())
                .recurrenceRule(recurrenceRule)
                .memberOccupationConcerned(findOccupationsByActivityId(rs.getString("id")))
                .build();
    }

    private List<MemberOccupation> findOccupationsByActivityId(String activityId) {
        List<MemberOccupation> occupations = new ArrayList<>();

        String sql = """
                select member_occupation
                from collectivity_activity_occupation
                where activity_id = ?
                order by member_occupation
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, activityId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                occupations.add(MemberOccupation.valueOf(rs.getString("member_occupation")));
            }

            return occupations;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding activity occupations: " + e.getMessage(), e);
        }
    }

    private LocalDateValue getLocalDateValue(ResultSet rs, String columnName) throws SQLException {
        Date date = rs.getDate(columnName);

        if (date == null) {
            return new LocalDateValue(null);
        }

        return new LocalDateValue(date.toLocalDate());
    }

    private record LocalDateValue(java.time.LocalDate value) {
    }
}
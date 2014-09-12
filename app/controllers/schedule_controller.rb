class ScheduleController < ApplicationController

  def index
    @weekly_schedules = WeeklySchedule.all
    @reloud_schedules = ReloudSchedule.all
    @office_cleanings_schedules = OfficeCleaningsSchedule.all
  end
end

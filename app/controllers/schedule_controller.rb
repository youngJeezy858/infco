class ScheduleController < ApplicationController
#  skip_before_filter :authenticate_user!

  def index
    @weekly_schedules = WeeklySchedule.all
    @reloud_schedules = ReloudSchedule.all
    @office_cleanings_schedules = OfficeCleaningsSchedule.all
  end
end

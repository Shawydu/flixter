class LessonsController < ApplicationController
	before_action :require_enroll_to_view_lesson

	def show
		
	end
	
	private

	def require_enroll_to_view_lesson
		@current_course = current_lesson.section.course
		if !@current_course.user.enrolled_in?(@current_course)
			redirect_to course_path(@current_course), alert: 'You Must Enroll as a kick start!'
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end

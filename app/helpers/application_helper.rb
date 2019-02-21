module ApplicationHelper
	def title(page_title="")
		site_title = "Event Manager"
		if page_title.empty?
			site_title
		else
			page_title + " | " + site_title
		end
	end
end

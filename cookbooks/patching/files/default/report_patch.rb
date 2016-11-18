require "chef/handler"
require 'csv'
class Chef
	class Handler
		class AwesomeReportHandler < Chef::Handler
		# Override report method from Chef::Handler
		  attr_reader :options
		  def initialize(opts = {})
		    @options = {
		      :packages_name => "",
		      :packages_installed => ""
		    }
		    @options.merge! opts
		  end
		def report
			# If the run was successful, run this code
			if @run_status.success?
				# Grab data from the @run_status object
				# and assign to local variables for clarity
				run_elapsed_time = @run_status.elapsed_time
				star_time = @run_status.start_time
				endtime = @run_status.end_time
				#recipe_name = @run_status.recipe.name
				node_name = @run_status.node.name
				resource_count = @run_status.all_resources.length
				updated_resources = @run_status.updated_resources
				updated_resource_count = updated_resources.length
				number_package = options[:packages_installed].delete!("\n")
				# Open output file in append mode and write handler output to it
					CSV.open("/tmp/silicus/reports/#{node_name}.csv", 'a+') do |file|
					file << ["aNode Name", "Status", "Node Plateform", "Starting Time And Date","Ending Time And Date","Total_Run_Time","Reboot","Number of packages updated is","Package names"]			
					file << ["#{node_name}", "Success", "#{node[:platform]}","#{star_time}", "#{endtime} seconds","#{run_elapsed_time} seconds" ,"Yes", "#{number_package}", "#{options[:packages_name ]}"]
					end					
				end	

			if @run_status.failed?
				run_elapsed_time = @run_status.elapsed_time
				star_time = @run_status.start_time
				endtime = @run_status.end_time
				#recipe_name = @run_status.recipe.name
				node_name = @run_status.node.name
				resource_count = @run_status.all_resources.length
				updated_resources = @run_status.updated_resources
				updated_resource_count = updated_resources.length
				number_package = options[:packages_installed].delete!("\n")
				# Open output file in append mode and write handler output to it
					CSV.open("/tmp/silicus/reports/#{node_name}.csv", 'a+') do |file|
					file << ["aNode Name", "Status", "Node Plateform", "Starting Time And Date","Ending Time And Date","Total_Run_Time","Reboot","Number of packages still available","Package names"]			
					file << ["#{node_name}", "Success", "#{node[:platform]}","#{star_time}", "#{endtime} seconds","#{run_elapsed_time} seconds" ,"No", "#{number_package}", "#{options[:packages_name ]}"]
					end					
				end	
            end
        
        end
    end
end		
		
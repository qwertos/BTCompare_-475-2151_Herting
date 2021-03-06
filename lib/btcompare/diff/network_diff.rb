
module BTCompare
	module Diff

		# Module included by BTCompare::Diff::Diff when 
		# networkize method is run. Overwrites other
		# methods to add jobs to the worker queue.
		module NetworkDiff

			# Creates a carve job in the master's job queue.
			# @param [File, String] in_file File data is coming from
			# @param [Integer] offset Starting offset
			# @param [Integer] length Length of chunk
			# @param [File, String] out_file File data is going to
			# @todo raise unacceptableargtype
			def carve in_file, offset, length, out_file
				case in_file
				when File
					in_file = in_file.path
				when String
				else
				end

				case out_file
				when File
					out_file = out_file.path
				when String
				else
				end

				job = {
					"method" => [
						'BTCompare',
						'Diff',
						'Diff',
						'carve'
					],
					"args" => {
						"in_file" => in_file,
						"offset" => offset,
						"length" => length,
						"out_file" => outfile
					}
				}

				@master.enqueue job
			end


			# Creates a Hex dump job in the master's job queue.
			# @param in_file [String, File] File data is coming from
			# @param out_file [String, File] File data is going to
			# @param metadata [Hash<String, String>] Info for user comfort
			# @todo Write method
			def carve in_file, out_file, metadata
				false
			end
		end
	end
end


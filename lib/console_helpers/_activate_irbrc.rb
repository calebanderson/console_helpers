# require File.expand_path('~/DeveloperTools/Console-Helpers/lib/console_helpers')
#
# ConsoleHelpers.mount(self)
# ReloaderHooks.register { ConsoleHelpers.reload }
# ConsoleHelpers.config_width(185)
#
# if Rails.env.test? || ENV['FACTORIES'].present?
#   Bundler.require(:test) if ENV['FACTORIES'].present?
#   load_relative 'spec/rails_helper'
#
#   ReloaderHooks.register do
#     ActiveSupport::Dependencies.mechanism = :load # not sure why this is necessary
#     FactoryBot.reload
#   end
# end
#
# PORT_PROCESSES = [:node, :nginx, :Electron].freeze
# KILL_PROCESS = -'awk \'{ system("kill "$1) }\''
#
# def clear_ports
#   count = proc { PORT_PROCESSES.sum { |p| `pgrep #{p}`.lines.size } }
#   start_count = count.call
#   PORT_PROCESSES.each { |p| `pkill #{p}` }
#   sleep(0.5)
#   puts "Killed #{start_count - count.call} of #{start_count} processes"
# end
#
# # def clear_ports
# #   start_count = 0
# #   end_count = 0
# #   PORT_PROCESSES.map do |greps|
# #     parts = ['ps -A', 'egrep \'\\?\\?\'', *greps.map { |g| "egrep '#{g}'" }]
# #     start_count += `#{parts.join(' | ')}`.lines.size
# #     `#{[*parts, KILL_PROCESS].join(' | ')}`
# #     end_count += `#{parts.join(' | ')}`.lines.size
# #   end
# #   [start_count, end_count]
# #
# #   # `ps -A | egrep '\\?\\?' | egrep 'Activate' | egrep 'node' `
# #   # `ps -A | egrep '\\d node app.js' | awk '{ system("kill "$1) }'`
# #   # `ps -A | egrep '\\d /Users.*node' | awk '{ system("kill "$1) }'`
# #   # # `ps -A | egrep '\\W8080' | awk '{ system("kill "$1) }'`
# #   # `ps -A | egrep '\\d nginx: master process' | awk '{ system("kill "$1) }'`
# # end
#
# def run_badge
#   require 'simplecov'
#   require 'shields_badge'
#
#   ENV['GITHUB_USER'] =         'calebanderson-centrak'
#   ENV['GITHUB_MAIL'] =         'calebanderson@centrak.com'
#   ENV['GITHUB_ORG'] =          'cetani'
#   ENV['GITHUB_REPO'] =         'cetani.github.io'
#   ENV['GITHUB_ACCESS_TOKEN'] = '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'
#   result = OpenStruct.new(covered_percent: 30)
#   SimpleCov::Formatter::ShieldsBadge.new.format(result)
# end

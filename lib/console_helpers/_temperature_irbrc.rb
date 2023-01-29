# require File.expand_path('~/DeveloperTools/Console-Helpers/lib/console_helpers')
#
# ConsoleHelpers.mount(self)
# ConsoleHelpers.config_width(185)
#
# ReloaderHooks.register(prepend: true) do
#   load_relative 'bridge/bridge_logger'
#   ConsoleHelpers.reload
# end
#
# if Rails.env.test? || ENV['FACTORIES']
#   require 'shoulda-matchers'
#   load_relative 'spec/rails_helper'
#
#   ReloaderHooks.register do
#     ActiveSupport::Dependencies.mechanism = :load # not sure why this is necessary
#     FactoryBot.reload
#   end
# end
#
# def enable_c2c(*site_ids)
#   site_ids = SensorTag.distinct.pluck(:gms_site_id) if site_ids.blank?
#   Settings::CentrakCloudToCloud.update(site_ids: site_ids)
# end
#
# def disable_c2c
#   Settings::CentrakCloudToCloud.update(site_ids: [])
# end
#
# def toggle_c2c(*site_ids)
#   Settings::CentrakCloudToCloud.site_ids.present? ? disable_c2c : enable_c2c(*site_ids)
# end
#
# LICENSE_CODE_MAP = {
#   30 => '30-day',
#   90 => '90-day',
#   year: '1-year',
#   never: 'never expires'
# }.freeze
#
# # Update the settings and save to generate the correct #digest
# def license_code(digest, sensor_count, expiration = :never, issue_date = Date.current)
#   Settings::System.new(
#     digest: digest.upcase.remove('-'),
#     count: sensor_count,
#     type: LICENSE_CODE_MAP.fetch(expiration, expiration),
#     issue_date: issue_date.to_date
#   ).hashed_secret
# end
#
# # Standard SQLServer explain breaks on its own weird double-single-quoted strings
# def explain(scope)
#   ActiveRecord::Base.connection.explain(scope.to_sql)
# end

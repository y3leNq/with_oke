require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WithOke
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # デフォルトのlocaleを日本語(:ja)になる
    config.i18n.default_locale = :ja

    # i18nの複数あるローケルファイルが読み込まれるようになる
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.assets false          # CSS, JavaScriptファイルを生成しない
      g.skip_routes true      # ルーティングを生成しない
      g.test_framework false  # testファイル生成をしない
      g.helper false          # helperを生成しない
    end
  end
end

Sentry.init do |config|
  config.dsn = 'https://2240b12bae90491daeee0a7ecf3fdd4e@o966290.ingest.sentry.io/5917170'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
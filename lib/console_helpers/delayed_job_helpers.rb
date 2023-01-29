return unless defined?(Delayed::Job)

module ConsoleHelpers
  module DelayedJobHelpers
    def run_jobs(scope, queues: Delayed::Job.distinct.pluck(:queue), name: 'irb')
      worker = Delayed::Worker.new(queues: queues)
      worker.name = name

      Array.wrap(scope).map do |job|
        reserved_job = Delayed::Job.reserve_with_scope(Delayed::Job.where(id: job), worker, Time.zone.now)
        Delayed::Worker.lifecycle.run_callbacks(:perform, worker, reserved_job) { worker.run(reserved_job) }
      end
    end
    alias run_job run_jobs

    def run_last_jobs(count = 1, queue: nil)
      run_jobs(Delayed::Job.last(count), { queues: queue }.compact).first
    end
    alias run_last_job run_last_jobs
  end

  include DelayedJobHelpers
end

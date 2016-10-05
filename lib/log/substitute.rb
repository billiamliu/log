module Log::Substitute
  def self.build
    instance = Log.build('(substitute logger)')
    sink = Log.register_telemetry_sink(instance)
    instance.telemetry_sink = sink
    instance
  end

  class Log < ::Log
    attr_accessor :telemetry_sink

    def io
      @io ||= NullIO.new
    end

    class NullIO
      def puts(*)
      end
    end
  end
end

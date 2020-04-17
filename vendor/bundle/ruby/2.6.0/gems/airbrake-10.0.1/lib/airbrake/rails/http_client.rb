# frozen_string_literal: true

# Monkey-patch to measure request timing.
class HTTPClient
  alias do_get_without_airbrake do_get_block

  def do_get_block(request, proxy, connection, &block)
    Airbrake::Rack.capture_timing(:http) do
      do_get_without_airbrake(request, proxy, connection, &block)
    end
  end
end

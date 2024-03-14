#Processes are isolated from each other, run concurrent to
#one another and communicate via message passing. Processes
#are not only the basis for concurrency in Elixir, but they
#also provide the means for building distributed and
#fault-tolerant programs.
#create a new process
defmodule KV.Processes do
  def start_process_and_send_message do
    pid = spawn(fn ->
      receive do
        {:hello, sender_pid} ->
          IO.puts("Got hello from #{inspect(sender_pid)}")
      end

    end)

    send(pid, {:hello, self()})
  end
end

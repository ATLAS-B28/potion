#Processes are isolated from each other, run concurrent to
#one another and communicate via message passing. Processes
#are not only the basis for concurrency in Elixir, but they
#also provide the means for building distributed and
#fault-tolerant programs.
#create a new process
defmodule KV.Processes do

 # def mailbox do
    #create pid with spawn function
    #which takes a function as an argument
    #where receive is used to receive messages
    #that takes the sender's pid and message type
   # pid = spawn(fn ->
     #receive do
      # {:hello, sender_pid} ->
     #    IO.puts("Hello, from the sender with pid #{inspect sender_pid}!")
    # end

   #  end)

  #  send(pid, {:hello, self()})
    #send - Sends a message to the given dest and returns the message.
    #dest may be a remote or local PID,
    #a local port, a locally registered name,
    #or a tuple in the form of {registered_name,
    #node} for a registered name at another node.
    #self() - Returns the PID (process identifier) of the calling process.
    #Allowed in guard clauses. Inlined by the com
 # end

 #State - maintained with processes
 #processes in elixir that can be looped
 #infinitely, maintain  state and send and receive
 #messages to it.
 #example - a process that works as K-V pair store

 def start_link do
  Task.start_link(fn ->
    loop(%{})
  end)
 end

 defp loop(map) do
   receive do
    {:get, key, caller} ->
      send(caller, Map.get(map,key))
      loop(map)
    {:put, key, value} ->
      loop(Map.put(map, key, value))
   end
  end



end




#KV.Processes.mailbox()
KV.Processes.start_link()

namespace :run do

  task :create, [:begin_date, :number_of_days, :client_name] => :environment do |t, args|
    renting = Renting.new(begin_date: args[:begin_date], number_of_days: args[:number_of_days], 
    client_name: args[:client_name])
    if renting.save
      puts "Aluguel agendado:"
      puts renting.inspect
    else
      puts "Erro ao efetuar agendamento:"
      for error in renting.errors.full_messages do
        puts error
      end
    end
  end

  task :check_availability, [:begin_date, :number_of_days] => :environment do |t, args|
    begin_date = Date.parse(args[:begin_date])
    puts Renting.availability(begin_date: begin_date, number_of_days: args[:number_of_days].to_i) ? 
    "Período disponível" : "Período indisponível"
  end

end
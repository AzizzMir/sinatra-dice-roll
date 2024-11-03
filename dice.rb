require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get '/' do
  File.read('static/index.html')
end

get "/dice/2/6" do
  first_die = rand(1..6)
  second_die = rand(1..6)
  original = File.read('static/2d6.html')
  added =
  "
  <h1>2d6</h1>
  <ul>
    <li>#{first_die}</li>
    <li>#{second_die}</li>
  </ul>
  "

  return original + added
end

get "/dice/2/10" do
  first_die = rand(1..10)
  second_die = rand(1..10)
  original = File.read('static/2d10.html')
  added =
  "
  <h1>2d10</h1>
  <ul>
    <li>#{first_die}</li>
    <li>#{second_die}</li>
  </ul>
  "

  return original + added
end

get "/dice/1/20" do
  first_die = rand(1..20)
  original = File.read('static/1d20.html')
  added =
  "
  <h1>1d20</h1>
  <ul>
    <li>#{first_die}</li>
  </ul>
  "

  return original + added
end

get "/dice/5/4" do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  forth_die = rand(1..4)
  fifth_die = rand(1..4)

  original = File.read('static/1d20.html')
  added =
  "
  <h1>5d4</h1>
  <ul>
    <li>#{first_die}</li>
    <li>#{second_die}</li>
    <li>#{third_die}</li>
    <li>#{forth_die}</li>
    <li>#{fifth_die}</li>
  </ul>
  "

  return original + added

end

ConsoleHelpers::Engine.routes.draw do
  match '/foo' => 'testing#root', via: :get
  root to: 'testing#root'
end

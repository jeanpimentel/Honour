Pod::Spec.new do |s|

  s.name         = "Honour"
  s.version      = "1.1.0"
  s.summary      = "iOS Validation Library"
  s.description  = "Validation library write in Swift for iOS projects."
  s.homepage     = "https://github.com/jeanpimentel/Honour"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Jean Pimentel" => "contato@jeanpimentel.com.br" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/jeanpimentel/Honour.git", :tag => s.version }
  s.source_files = "Honour/Library/**/*.swift"
  s.requires_arc = true

end

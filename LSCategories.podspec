Pod::Spec.new do |s|
  s.name          = "LSCategories"
  s.version       = "1.0"
  s.summary       = "This is a collection of useful Foundation and UIKit categories."
  s.homepage      = "https://github.com/fins/LSCategories"
  s.license       = "MIT"
  s.author        = "Leszek S"
  s.source        = { :git => "https://github.com/fins/LSCategories.git", :tag =>  "1.0" }
  s.platform      = :ios, "7.0"
  s.source_files  = "LSCategories"
  s.requires_arc  = true
end
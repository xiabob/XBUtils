Pod::Spec.new do |s|
  s.name         = 'XBUtils'
  s.version      = '1.0'
  s.authors      = { 'xiabob' => 'xiabob@yeah.net' }
  s.homepage     = 'https://github.com/xiabob/XBUtils'
  s.source       = { :git => 'https://github.com/xiabob/XBUtils.git', :tag => '1.0' }
  s.source_files = 'XBUtils/XBUtils/Class/*.{h.m}'
  s.requires_arc = true
  s.platform     = :ios, '8.0'

end
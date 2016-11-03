#
# Be sure to run `pod lib lint NonCoalescingDispatchQueue.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NonCoalescingDispatchQueue'
  s.version          = '0.1.1'
  s.summary          = 'A non-coalescing dispatch queue.'
  s.description      = <<-DESC
    'GCD likes to coalesce calls to -dispatchAfter. This queue avoids that coalescence with the use of a CADisplayLink.'
  DESC

  s.homepage         = 'https://github.com/briansemiglia/NonCoalescingDispatchQueue'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Semiglia' => 'brian.semiglia@gmail.com' }
  s.source           = { :git => 'https://github.com/briansemiglia/NonCoalescingDispatchQueue.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'NonCoalescingDispatchQueue/Classes/**/*'
end

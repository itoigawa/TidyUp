FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "name-#{n}" }
    category { :トップス }
    color { :レッド }
    scene { :プライベート }
    purchased_at { '2020-09-05' }
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/sample.jpeg'))}
  end
end
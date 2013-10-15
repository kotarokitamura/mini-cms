#coding:utf-8

Organization.create(:organization_name => '株式会社ソーシャルグループウェア', :organization_code => 'sgw')
Organization.create(:organization_name => '株式会社GaiaX', :organization_code => 'gaiax')
Organization.create(:organization_name => '株式会社サントリー', :organization_code => 'suntory')

OrganizationInfo.create(:organization_id => 1, :phone => '080-1234-5678')
OrganizationInfo.create(:organization_id => 1, :phone => '080-4321-5678')
OrganizationInfo.create(:organization_id => 1, :phone => '080-7098-5678')
OrganizationInfo.create(:organization_id => 2, :phone => '080-1234-5678')
OrganizationInfo.create(:organization_id => 2, :phone => '080-1234-5678')
OrganizationInfo.create(:organization_id => 2, :phone => '080-4321-5678')
OrganizationInfo.create(:organization_id => 3, :phone => '080-7098-5678')
OrganizationInfo.create(:organization_id => 3, :phone => '080-4321-5678')
OrganizationInfo.create(:organization_id => 3, :phone => '080-7098-5678')

Product.create(:organization_id => 1, :product_name => 'iQube')
Product.create(:organization_id => 1, :product_name => 'Commitia')
Product.create(:organization_id => 1, :product_name => 'Mini-cms')
Product.create(:organization_id => 2, :product_name => 'airy')
Product.create(:organization_id => 2, :product_name => 'coblog')
Product.create(:organization_id => 2, :product_name => 'hoge')
Product.create(:organization_id => 3, :product_name => '森の天然水')
Product.create(:organization_id => 3, :product_name => 'プレミアムモルツ')
Product.create(:organization_id => 3, :product_name => '黒烏龍茶')

Store.create(:organization_id => 1, :store_name => '五反田')
Store.create(:organization_id => 1, :store_name => '大崎')
Store.create(:organization_id => 1, :store_name => '渋谷')
Store.create(:organization_id => 2, :store_name => '五反田')
Store.create(:organization_id => 2, :store_name => '大崎')
Store.create(:organization_id => 2, :store_name => '渋谷')
Store.create(:organization_id => 3, :store_name => '五反田')
Store.create(:organization_id => 3, :store_name => '大崎')
Store.create(:organization_id => 3, :store_name => '渋谷')

ViewDesign.create(:organization_id => 1, :design_number => 0)
ViewDesign.create(:organization_id => 2, :design_number => 1)
ViewDesign.create(:organization_id => 3, :design_number => 2)


User.create(:id => 1, :email => 'test@example.com', :password => 'password', :organization_id => 1, :first_name => 'Kotaro', :last_name => 'Kitamura')
User.create(:id => 2, :email => 'test1@example.com', :password => 'password', :organization_id => 2, :first_name => 'Taro', :last_name => 'Sato')
User.create(:id => 3, :email => 'test2@example.com', :password => 'password', :organization_id => 3, :first_name => 'Satoshi', :last_name => 'Tanaka')

Image.create(:id => 1, :organization_id => 1, :logo_file_name => 'rails.png')
Image.create(:id => 2, :organization_id => 2, :logo_file_name => 'rails.png')
Image.create(:id => 3, :organization_id => 3, :logo_file_name => 'rails.png')

for i in [1,2,3] do
  FileUtils.mkdir_p("./public/system/images/logos/000/000/00#{i}/thumb")
  FileUtils.mkdir_p("./public/system/images/logos/000/000/00#{i}/original")
  FileUtils.mkdir_p("./public/system/images/logos/000/000/00#{i}/medium")

  FileUtils.copy("./db/seed_image/rails.png","./public/system/images/logos/000/000/00#{i}/thumb/")
  FileUtils.copy("./db/seed_image/rails.png","./public/system/images/logos/000/000/00#{i}/original/")
  FileUtils.copy("./db/seed_image/rails.png","./public/system/images/logos/000/000/00#{i}/medium/")
end

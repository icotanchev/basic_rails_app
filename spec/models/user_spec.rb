require 'spec_helper'

describe User do
  
  context 'admin?' do
  	context 'returns' do
	  	it 'true when role is admin' do
	  		expect(build(:user, :admin).admin?).to eq true
	  	end

	  	it 'false when role is\'t admin' do
	  		expect(build(:user).admin?).to eq false
	  	end
	  end
  end

  context 'user?' do
  	context 'returns' do
	  	it 'true when role is user' do
	  		expect(build(:user, :user).user?).to eq true
	  	end

	  	it 'false when role is\'t user' do
	  		expect(build(:user, :admin).user?).to eq false
	  	end
	  end
  end

  context 'full_name' do
  	it 'returns full name of user' do
  		expect(build(:user, :admin).full_name).to eq 'Admin Admin'
  	end
  end

  context 'set default user role' do
  	it 'sets default role to \'user\' when role is not passed' do
  		user = build(:user, :john_doe)
  		user.save!
  		expect(user.user?).to eq true
  	end
  end
end

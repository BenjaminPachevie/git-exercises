require 'git'

describe 'The Git Repository' do
  before(:all) do
    @g = Git.open('./')
  end

  it 'should exist' do
    expect(@g).to be_instance_of(Git::Base)
  end

  it 'should have a commit' do
    expect(@g.log[0]).not_to be_instance_of(Git::GitExecuteError)
  end

  it 'should have a branch called feature-2a that includes the commits of feature-1b' do
    expect(@g.branches.any? { |b| b.name == 'feature-2a' }).to be true
    expect(@g.branch('feature-2a').contains?('feature-1b')).to be true
  end

  it 'should have a branch called feature-2a that includes the commits of feature-1a' do
    expect(@g.branches.any? { |b| b.name == 'feature-2a' }).to be true
    expect(@g.branch('feature-2a').contains?('feature-1a')).to be true
  end

  it 'should have a branch called feature-2a that includes the commits of feature-1' do
    expect(@g.branches.any? { |b| b.name == 'feature-2a' }).to be true
    expect(@g.branch('feature-2a').contains?('feature-1')).to be true
  end
end

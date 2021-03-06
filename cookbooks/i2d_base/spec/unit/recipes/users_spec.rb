#
# Cookbook Name:: i2d_base
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'i2d_base::users' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new do |node|
        node.set[:cheffian][:role] = 'ws'
        node.set[:cheffian][:org] =  'fluxx'
        node.automatic[:ec2][:public_hostname] = 'ec2.aws'
      end

      runner.converge(described_recipe)
    end

    before do
      stub_command("which sudo").and_return('/bin/sudo')
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'create git_config' do
      expect(chef_run).to render_file('/home/alpha/.gitconfig')
        .with_content(/git_templates/)
    end


    it 'create the git template' do
      expect(chef_run) \
       .to render_file('/home/alpha/.git_templates/hooks/pre-commit')
       .with_content(/STOP THE PRESS/)
    end

  end
end

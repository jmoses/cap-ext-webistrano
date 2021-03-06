$:.unshift(File.dirname(File.expand_path(__FILE__)))
require 'cap_ext_webistrano/task'
require 'active_resource'
require 'cap_ext_webistrano/project'

module CapExtWebistrano
  def task(*args, &blk)
    original_task(*args, &hijack_runner)
  end

  def after(*args)
  end

  def on(*args)
  end

  def before(*args)
  end
end

Capistrano::Configuration::Namespaces.class_eval do
  alias :original_task :task
  include CapExtWebistrano
end

Capistrano::Configuration::Execution.class_eval do
  alias :original_find_and_execute_task :find_and_execute_task
  
  def hijack_runner
    @hijack_runner ||= lambda { CapExtWebistrano::Task.new(current_task.fully_qualified_name, self).run }
  end
  
  def hijack_capistrano
    tasks.each {|tsk| tsk.last.instance_variable_set(:@body, hijack_runner)}
    namespaces.each {|nmspace| nmspace.last.tasks.each {|tsk| tsk.last.instance_variable_set(:@body, hijack_runner)}}
  end
  
  def find_and_execute_task(task, hooks = {})
    hijack_capistrano
    @callbacks = {}
    begin
      original_find_and_execute_task(task, {})
    rescue Capistrano::NoSuchTaskError
      CapExtWebistrano::Task.new(task, self).run
    end
  end
end
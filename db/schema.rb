# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140626200824) do

  create_table "backup_checks", :force => true do |t|
    t.string   "name"
    t.boolean  "passed"
    t.integer  "ticket_number"
    t.integer  "internal_check_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "backup_checks", ["internal_check_id"], :name => "index_backup_checks_on_internal_check_id"

  create_table "backup_entries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "internal_checks", :force => true do |t|
    t.date     "date"
    t.string   "owner"
    t.string   "signed_off_by"
    t.boolean  "passed"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "operations_checks", :force => true do |t|
    t.string   "owner"
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reloud_checks", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reloud_entries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "space_checks", :force => true do |t|
    t.string   "name"
    t.boolean  "passed"
    t.integer  "ticket_number"
    t.integer  "internal_check_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "space_checks", ["internal_check_id"], :name => "index_space_checks_on_internal_check_id"

  create_table "space_entries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

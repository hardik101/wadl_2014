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

ActiveRecord::Schema.define(:version => 20140731114409) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",                   :null => false
    t.string   "resource_type",                 :null => false
    t.integer  "author_id",                     :null => false
    t.string   "author_type",                   :null => false
    t.string   "member",        :default => "", :null => false
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "members", :force => true do |t|
    t.string   "email",                     :default => "",          :null => false
    t.string   "encrypted_password",        :default => "",          :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             :default => 0,           :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "is_admin",                  :default => false,       :null => false
    t.string   "firstname",                 :default => "",          :null => false
    t.string   "lastname",                  :default => "",          :null => false
    t.string   "role",                      :default => "",          :null => false
    t.string   "diet_pref",                 :default => "",          :null => false
    t.boolean  "grant",                     :default => false
    t.string   "diet_msg"
    t.string   "affiliation",               :default => "",          :null => false
    t.string   "registered_for",            :default => "WADT only", :null => false
    t.string   "country",                   :default => "Germany",   :null => false
    t.integer  "fees",                      :default => 1,           :null => false
    t.string   "proof_of_pay_file_name"
    t.string   "proof_of_pay_content_type"
    t.integer  "proof_of_pay_file_size"
    t.datetime "proof_of_pay_updated_at"
  end

  add_index "members", ["confirmation_token"], :name => "index_members_on_confirmation_token", :unique => true
  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "stages", :force => true do |t|
    t.integer  "stage_number", :default => 1, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end

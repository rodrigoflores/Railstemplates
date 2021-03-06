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

ActiveRecord::Schema.define(:version => 20101017194147) do

  create_table "commentaries", :force => true do |t|
    t.text     "commentary"
    t.integer  "githubber_id"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "githubbers", :force => true do |t|
    t.string   "email",                             :default => ""
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "name"
    t.string   "github_token"
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
  end

  add_index "githubbers", ["email"], :name => "index_githubbers_on_email", :unique => true

  create_table "likes", :force => true do |t|
    t.integer  "githubber_id"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "templates", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "source_url"
    t.integer  "githubber_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "download_counter", :default => 0
  end

  create_table "thumbs", :force => true do |t|
    t.boolean  "up"
    t.integer  "template_id"
    t.integer  "githubber_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

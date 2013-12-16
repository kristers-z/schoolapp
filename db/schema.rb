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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131027153720) do

  create_table "cabinets", force: true do |t|
    t.integer "nr", limit: 1
  end

  create_table "days", force: true do |t|
    t.string "day", limit: 11
  end

  create_table "grades", force: true do |t|
    t.integer "number", limit: 1
    t.string  "letter", limit: 1
  end

  create_table "lesson_changes", force: true do |t|
    t.date    "date"
    t.integer "cabinet_id"
    t.integer "plkst_id"
    t.integer "teaching_relation_id"
  end

  create_table "lessons", force: true do |t|
    t.integer "day_id"
    t.integer "plkst_id"
    t.integer "cabinet_id"
    t.integer "teaching_relation_id"
  end

  create_table "plksts", force: true do |t|
    t.integer "nr",    limit: 1
    t.string  "plkst", limit: 5
  end

  create_table "subjects", force: true do |t|
    t.string "subject", limit: 30
  end

  create_table "teachers", force: true do |t|
    t.string "first_name", limit: 30
    t.string "last_name",  limit: 30
  end

  create_table "teaching_relations", force: true do |t|
    t.integer "grade_id"
    t.integer "subject_id"
    t.integer "teacher_id"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_17_104256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "establishments", force: :cascade do |t|
    t.serial "cnes_id", null: false
    t.decimal "latitude", precision: 15, scale: 13, null: false
    t.decimal "longitude", precision: 15, scale: 13, null: false
    t.string "name"
    t.string "address"
    t.string "number"
    t.string "neighborhood"
    t.string "city", null: false
    t.string "uf", null: false
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnes_id"], name: "index_establishments_on_cnes_id", unique: true
    t.index ["latitude"], name: "index_establishments_on_latitude"
    t.index ["longitude"], name: "index_establishments_on_longitude"
  end


  create_function :haversine, sql_definition: <<-SQL
      CREATE OR REPLACE FUNCTION public.haversine(latitude1 numeric, longitude1 numeric, latitude2 numeric, longitude2 numeric)
       RETURNS double precision
       LANGUAGE sql
      AS $function$
        SELECT 6371 * ACOS(
                              COS(RADIANS(latitude1))
                            * COS(RADIANS(latitude2))
                            * COS(RADIANS(longitude1) - RADIANS(longitude2))
                            + SIN(RADIANS(latitude1))
                            * SIN(RADIANS(latitude2))
                          ) AS distance
      $function$
  SQL
end

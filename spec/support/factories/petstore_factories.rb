require_relative '../models/obj_petstore.rb'
require_relative '../models/obj_petstore_update_status.rb'
require_relative '../models/obj_petstore_formdata.rb'

id = rand(0..100)
name = Faker::Creature::Dog.name

FactoryBot.define do
    factory :attr_petstore, class: ObjPetStore do
        id          {id}
        category    {
            {
                "id": rand(0..100),
                "name": Faker::Creature::Dog.size
            }
        }
        name        {name}
        photoUrls   {}
        tags        {[
            {
            "id": rand(0..100),
            "name": Faker::Creature::Dog.size
            }
        ]}
        status      {"available"}
    end

    factory :attr_petstore_update_status, class: ObjPetStoreUpdateStatus do
        id          {id}
        status      {"pending"}
    end

    factory :attr_petstore_formdata, class: ObjPetStoreFormData do
        name        {name}
        status      {"sold"}
    end
end
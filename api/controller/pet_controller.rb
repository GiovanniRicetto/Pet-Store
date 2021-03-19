class PetStore 

    def postPet(body)
        url = "#{$env["base_url"]}"
        response = without_authentication('post', url, body.to_json)
    end

    def getPet(id)
        url = "#{$env["base_url"]}/#{id}"
        response = without_authentication('get', url)
    end

    def getPetByStatus
        url = "#{$env["base_url"]}/findByStatus?status=available"
        response = without_authentication('get', url)
    end

    def putPet(body)
        url = "#{$env["base_url"]}"
        response = without_authentication('put', url, body.to_json)
    end


    def postPetFormData(id, body)
        url = "#{$env["base_url"]}/#{id}"
        response = without_authentication('post', url,  body, content_type_value = 'application/x-www-form-urlencoded')
    end


    def deletePet(id)
        url = "#{$env["base_url"]}/#{id}"
        response = without_authentication('delete', url)
    end

end

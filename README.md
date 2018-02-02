# README

My first application with graphQL api. :)

# Sample request
```
query {  
  me {
    id
    email
  }

  projects {
    id
    title

    user {
      id
      email
    }
  }

    my_projects {
    id
    title

    user {
      id
      email
    }
  }
}
```

# hanikamu-active_command
A service design playing with active model errors.

The active_command is helping to use service within no API contexts like active_admin or classic Rails COntrollers.

Basically is offering errors as ActiveModel::Erros so they are mergeable with our ActiveRecord model instance errors or any similar input object dealing with the state of the form in the view

Basic Example:

```ruby
result = UserUpdateCommand.call(name: 12345, id: 3)

@user = User.find(id: 3)
@user.errors.merge!(result.failure.errors)
```

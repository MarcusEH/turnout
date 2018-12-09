json.array! @invites do |invite|
  json.partial! "invite.json.jbuilder", invite: invite
end
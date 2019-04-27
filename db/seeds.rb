users = User.create(
	[
		{ name: 'First user', cpf: rand(000000001..999999999), email: 'first_user@email.com' },
		{ name: 'Second user', cpf: rand(000000001..999999999), email: 'second_user@email.com' },
	]
)

orders = Order.create(
	[
		{ user_id: users.first.id, phone_model: 'Phone A', imei: rand(000000000000001..999999999999999), annual_value: rand(200.00..350.00), installments: rand(1..12) },
		{ user_id: users.last.id, phone_model: 'Phone B', imei: rand(000000000000001..999999999999999), annual_value: rand(200.00..350.00), installments: rand(1..12) },
	]
)

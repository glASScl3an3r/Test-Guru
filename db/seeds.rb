categories = Category.create([
  { title: 'pwn' },
  { title: 'reverse' },
  { title: 'forensics' },
  { title: 'история россии' }
])

users = User.create([
  { name: 'Иван Владимирович' },
  { name: 'Владимир Иванович' },
  { name: "d'Amir" },
  { name: "' UNION SELECT * FROM users -- " }
])

tests = Test.create([
  { title: '20й век в истории россии', category_id: categories[3].id, author_id: users[0].id },
  { title: 'sql injections', category_id: categories[0].id, author_id: users[3].id },
  { title: 'x86 buffer overflow', category_id: categories[0].id, author_id: users[0].id  },
  { title: 'x86 rop chains', category_id: categories[0].id, author_id: users[1].id },
  { title: 'wewe', category_id: categories[0].id, author_id: users[2].id }
])

questions = Question.create([
  { text: 'Когда?', test_id: tests[0].id },
  { text: 'Где?', test_id: tests[0].id },
  { text: "' OR 1 = 1 -- ", test_id: tests[1].id },
  { text: 'void woops() { char x[64]; scanf("%s", x); }. How?', test_id: tests[2].id },
  { text: 'sample text', test_id: tests[3].id },
  { text: 'sample text', test_id: tests[4].id }
])

answers = Answer.create([
  { text: 'там', question_id: questions[0].id },
  { text: 'тогда', question_id: questions[1].id },
  { text: 'a2', question_id: questions[2].id },
  { text: 'a3', question_id: questions[3].id },
  { text: 'a4', question_id: questions[4].id },
  { text: 'a5', question_id: questions[5].id }
])

passed_tests = PassedTest.create([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[0].id, test_id: tests[3].id },
  { user_id: users[1].id, test_id: tests[0].id },
  { user_id: users[2].id, test_id: tests[1].id }
])

categories = Category.create!([
  { title: 'pwn' },
  { title: 'reverse' },
  { title: 'forensics' },
  { title: 'история россии' }
])

users = User.create!([
  { name: 'Иван Владимирович' },
  { name: 'Владимир Иванович' },
  { name: "d'Amir" },
  { name: "' UNION SELECT * FROM users -- " }
])

tests = Test.create!([
  { title: '20й век в истории россии', category_id: categories[3].id, author_id: users[0].id },
  { title: 'sql injections', category_id: categories[0].id, author_id: users[3].id },
  { title: 'x86 buffer overflow', category_id: categories[0].id, author_id: users[0].id  },
  { title: 'x86 rop chains', category_id: categories[0].id, author_id: users[1].id },
  { title: 'wewe', category_id: categories[0].id, author_id: users[2].id }
])

questions = Question.create!([
  { text: 'Когда?', test_id: tests[0].id },
  { text: 'Где?', test_id: tests[0].id },
  { text: "' OR 1 = 1 -- ", test_id: tests[1].id },
  { text: "question2 test1", test_id: tests[1].id },
  { text: 'void woops() { char x[64]; scanf("%s", x); }. How?', test_id: tests[2].id },
  { text: 'question2', test_id: tests[2].id },
  { text: 'question1 test3', test_id: tests[3].id },
  { text: 'question2 test3', test_id: tests[3].id },
  { text: 'question1 test4', test_id: tests[4].id },
  { text: 'question2 test4', test_id: tests[4].id }
])

answers = Answer.create!([
  { text: 'там', question_id: questions[0].id, correct: true },
  { text: 'не там', question_id: questions[0].id },
  { text: 'вооон там', question_id: questions[0].id },
  { text: 'тогда', question_id: questions[1].id, correct: true },
  { text: 'не тогда', question_id: questions[1].id },
  { text: 'answer1 q2', question_id: questions[2].id, correct: true },
  { text: 'answer2 q2', question_id: questions[2].id },
  { text: 'answer1 q3', question_id: questions[3].id, correct: true },
  { text: 'answer2 q3', question_id: questions[3].id },
  { text: 'answer1 q4', question_id: questions[4].id, correct: true },
  { text: 'answer2 q4', question_id: questions[4].id },
  { text: 'answer1 q5', question_id: questions[5].id, correct: true },
  { text: 'answer2 q5', question_id: questions[5].id },
  { text: 'answer1 q6', question_id: questions[6].id, correct: true },
  { text: 'answer2 q6', question_id: questions[6].id },
  { text: 'answer1 q7', question_id: questions[7].id, correct: true },
  { text: 'answer2 q7', question_id: questions[7].id },
  { text: 'answer1 q8', question_id: questions[8].id, correct: true },
  { text: 'answer2 q8', question_id: questions[8].id },
  { text: 'answer1 q9', question_id: questions[9].id, correct: true },
  { text: 'answer2 q9', question_id: questions[9].id },
])

passed_tests = PassedTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[0].id, test_id: tests[3].id },
  { user_id: users[1].id, test_id: tests[0].id },
  { user_id: users[2].id, test_id: tests[1].id }
])

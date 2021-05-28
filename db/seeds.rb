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
  { title: '20й век в истории россии', category: categories[3], author: users[0] },
  { title: 'sql injections', category: categories[0], author: users[3] },
  { title: 'x86 buffer overflow', category: categories[0], author: users[0] },
  { title: 'x86 rop chains', category: categories[0], author: users[1] },
  { title: 'wewe', category: categories[0], author: users[2] }
])

questions = Question.create!([
  { text: 'Когда?', test: tests[0] },
  { text: 'Где?', test: tests[0] },
  { text: "' OR 1 = 1 -- ", test: tests[1] },
  { text: "question2 test1", test: tests[1] },
  { text: 'void woops() { char x[64]; scanf("%s", x); }. How?', test: tests[2] },
  { text: 'question2', test: tests[2] },
  { text: 'question1 test3', test: tests[3] },
  { text: 'question2 test3', test: tests[3] },
  { text: 'question1 test4', test: tests[4] },
  { text: 'question2 test4', test: tests[4] }
])

answers = Answer.create!([
  { text: 'там', question: questions[0], correct: true },
  { text: 'не там', question: questions[0], },
  { text: 'вооон там', question: questions[0], },
  { text: 'тогда', question: questions[1], correct: true },
  { text: 'не тогда', question: questions[1] },
  { text: 'answer1 q2', question: questions[2], correct: true },
  { text: 'answer2 q2', question: questions[2] },
  { text: 'answer1 q3', question: questions[3], correct: true },
  { text: 'answer2 q3', question: questions[3] },
  { text: 'answer1 q4', question: questions[4], correct: true },
  { text: 'answer2 q4', question: questions[4] },
  { text: 'answer1 q5', question: questions[5], correct: true },
  { text: 'answer2 q5', question: questions[5] },
  { text: 'answer1 q6', question: questions[6], correct: true },
  { text: 'answer2 q6', question: questions[6] },
  { text: 'answer1 q7', question: questions[7], correct: true },
  { text: 'answer2 q7', question: questions[7] },
  { text: 'answer1 q8', question: questions[8], correct: true },
  { text: 'answer2 q8', question: questions[8] },
  { text: 'answer1 q9', question: questions[9], correct: true },
  { text: 'answer2 q9', question: questions[9] },
])

passed_tests = PassedTest.create!([
  { user: users[0], test: tests[0] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[2] },
  { user: users[0], test: tests[3] },
  { user: users[1], test: tests[0] },
  { user: users[2] , test: tests[1] }
])

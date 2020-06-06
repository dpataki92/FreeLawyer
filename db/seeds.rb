# Creating clients
c1= Client.create(username: "client003", email: "myemail@gmail.com", password: "clientpw005")
c2 =Client.create(username: "client233", email: "ttfdc@gmail.com", password: "clientpw03445")
c3= Client.create(username: "client123", email: "eeddw@gmail.com", password: "clientpw0342")
c4= Client.create(username: "client417", email: "wefeq@gmail.com", password: "clientpw0324")
c5 = Client.create(username: "client213", email: "rtgbbtvrbb@gmail.com", password: "clientpw23r")
c6 = Client.create(username: "client066", email: "fevevr@gmail.com", password: "clientpw2er3")
c7 = Client.create(username: "client554", email: "qwwx@gmail.com", password: "clientpw3f3")
c8= Client.create(username: "client221", email: "nzjtz23@gmail.com", password: "clientpw45")
c9 = Client.create(username: "client372", email: "ewfefvh4@gmail.com", password: "clientpw323")
c10 = Client.create(username: "client010", email: "1333tg5h@gmail.com", password: "clientpw78")
c11 = Client.create(username: "client999", email: "nttzum@gmail.com", password: "clientpw7u7u7")

# Creating lawyers
Lawyer.create(username: "lawyer323", email: "njlkbhvk@gmail.com", password: "lawpw005")
Lawyer.create(username: "lawyer456", email: "mmkmn@gmail.com", password: "lawyerpw03445")
Lawyer.create(username: "lawyer999", email: "mknohvu@gmail.com", password: "lawpw0342")
Lawyer.create(username: "lawyer555", email: "obibv@gmail.com", password: "legalpw0324")
Lawyer.create(username: "lawyer444", email: "lnibvuotci@gmail.com", password: "attorneypw23r")
Lawyer.create(username: "lawyer777", email: "oubvct@gmail.com", password: "pw2er3")
Lawyer.create(username: "lawyer888", email: "ergt4r@gmail.com", password: "rth4j5")
Lawyer.create(username: "lawyer222", email: "tbrthhz@gmail.com", password: "g35th4wh")
Lawyer.create(username: "lawyer333", email: "weffw@gmail.com", password: "43z4h6h")
Lawyer.create(username: "lawyer101", email: "fwf@gmail.com", password: "345h5")

# Creating questions
q1 = Question.create(title: "Are there any EU rules on how much registration tax I have to pay in Cyprus?", description: "I have retired and am going to live full-time in my holiday home in Cyprus. I am bringing my car, which was bought and registered in Hungary.", jurisdiction: "Republic of Cyprus", area: "Tax Law")
q2 = Question.create(title: "Tax exemptions on purchases of property", description: "I am planning to move to the UK from Hungary where I work and pay taxes. If I buy or build a home in another Member State, am I eligible for a tax deduction in my home country?", jurisdiction: "Hungary", area: "Tax Law")
q3 = Question.create(title: "Isn't double taxation prohibited under EU law?", description: "I have inherited property and am being taxed in both the country where I normally pay taxes(Italy) and the country where the inherited property is located(Austria).", jurisdiction: "Austria", area: "Tax Law")
q4 = Question.create(title: "What are the legal consequences of a divorce under French law as regards the obligation to pay maintenance to the other spouse?", description: "I am an Italian citizen who lives in France and we are about to divorce with my French wife in France.", jurisdiction: "France", area: "Family Law")
q5 = Question.create(title: "What are the grounds for divorce in Spain?", description: "I am Litvanian and I want a divorce with my Spanish wife. We have been living in Spain together for 4 years now and we have been married for 2,5 years.", jurisdiction: "Spain", area: "Family Law")
q6 = Question.create(title: "Visa rules in Spain", description: "I am Italian and my husband and children are Colombian nationals. Will they need a visa to travel with me from Brazil, where we live, to Spain?", jurisdiction: "Spain", area: "Immigration Law")
q7 = Question.create(title: "Moving to Ireland with a son from my wife's previous marriage", description: "I am moving to Ireland and my Japanese spouse and I would like to be joined there by her 22-yeal old Japanese son of a previous marriage, who is dependent on us, so that he can undertake studies there? Is that possible?", jurisdiction: "Ireland", area: "Immigration Law")
q8 = Question.create(title: "Holiday entitlement in Germany", description: "How much paid leave I can get if I only work 5 months in Germany?", jurisdiction: "Germany", area: "Labour Law")
q9 = Question.create(title: "Missing employment contract from German employer", description: "I started to work for a German company 6 weeks ago and I was told I would get my contract signed after the first week. I still haven't gotten anything but they keep giving me new tasks to do. Is it legal?", jurisdiction: "Germany", area: "Labour Law")
q10 = Question.create(title: "Using phone conversations in a criminal case as evidence", description: "Is it mandatory for a telecom company to produce electronic evidence if it can be used in a criminal case. I will have a criminal court hearing in Portugal and the only evidence I have would be a previous conversation with the alleged victim.", jurisdiction: "Portugal", area: "Criminal Law")

q1.client = c1
q1.save
q2.client = c2
q2.save
q3.client = c3
q3.save
q4.client = c4
q4.save
q5.client = c5
q5.save
q6.client = c6
q6.save
q7.client = c7
q7.save
q8.client = c8
q8.save
q9.client = c8
q9.save
q10.client = c9
q10.save
# Creating answers
q1.answers.create(content: "NO. If you move to another EU country for more than 6 months, you must under EU rules register your car in the new country.For registration taxes, however, there are no EU-wide rules. Countries may levy car-registration taxes or not, as they choose. Some –including Cyprus–do NOT tax you if you had to pay a similar tax when you bought the car new.", lawyer_id: 1, upvotes: 0)
q1.answers.create(content: "If a country does tax imported second-hand cars, it must take account of the residual value when setting the amount of registration tax. Example: your type of car has a value in the new country of€10,000 when new and the tax on such a car would be €2,500 so that the car would cost €12,500 intotal and the tax component of the price would be 20%. Assume that you move the car when it is 5 years old and that after 5 years a similar car in the new country would be expected to have lost 30% of its value and only to be worth about €8,750. In that case the tax to be applied in the newcountry could only be 20% of €8,750 i.e. €1750. ", lawyer_id: 2, upvotes: 0)
q2.answers.create(content: "MAYBE. Under EU law, a country cannot limit tax deductions for residents to houses or apartmentsbought or built on its own territory.However, countries ARE allowed to apply different rules to different situations. Example: somecountries allow a tax deduction for the purchase of primary homes but NOT for holiday homes or investment properties. In such a situation, it might NOT be illegal for your country to refuse you a tax deduction for property located abroad if that property will not become your primary home immediately after purchase.", lawyer_id: 2, upvotes: 0)
q3.answers.create(content: "NO. If you inherit property located in an EU country other than the country in which you live, you may be subject to the inheritance-tax laws of both countries and there is nothing in EU law that prohibits double taxation", lawyer_id: 1, upvotes: 0)
q4.answers.create(content: "The payment of maintenance by one spouse to the other is an interim measure, i.e. maintenance is paid only until the divorce is granted. Once the divorce has been granted, one spouse may claim only a compensatory payment (prestation compensatoire) or damages from the other spouse. This can be set amicably in a divorce by judicial or non-judicial mutual consent or by the judge in other cases.", lawyer_id: 3, upvotes: 0)
q4.answers.create(content: "The aim of this compensatory payment is to compensate for the disparity that the breakdown of the marriage may create in the respective living conditions of the spouses. Its amount is set by the judge according to the incomes and needs of each spouse. It is by nature a lump sum that is paid, in principle, in the form of capital: either through the payment of a sum of money for which terms of payment may be agreed; or through the allocation of owned assets or a right of use, habitation or usufruct, either on a temporary basis or for life.", lawyer_id: 4, upvotes: 0)
q4.answers.create(content: "Exceptionally, the compensatory payment may be set as a life annuity, which may, in the event of changes in the resources or needs of the spouses, be revised downwards. Damages can be awarded to a spouse if the divorce has particularly severe consequences for him/her: where he/she is the respondent in a divorce due to irretrievable breakdown of the marriage and has not applied for divorce; or where the divorce is granted against the other spouse and the blame lies entirely with the latter.", lawyer_id: 5, upvotes: 0)
q5.answers.create(content: "Since the reform introduced by Law 15/2005, divorce in Spain does not require any grounds, since maintaining the marriage bond is considered to be a manifestation of the free will of the spouses.", lawyer_id: 6)
q6.answers.create(content: "They will need a visa because Colombia is on the list of countries whose nationals require a visa. However, as family members of an EU citizen travelling with you, they have a right to obtain thevisa and can get it free of charge and under an accelerated procedure. Besides, a uniform short stayvisa will be valid for all countries of the Schengen area.", lawyer_id: 7)
q7.answers.create(content: "Yes. Since he is your wife’s son and dependent on you, he can join you in Ireland.", lawyer_id: 8)
q8.answers.create(content: "Workers are entitled to at least 24 working days of paid annual leave per calendar year. That is four weeks’ holiday per year, as Saturdays also count as working days. You only gain this entitlement after being employed for six months. If you are employed for a shorter period than six months, you are entitled to holiday leave on a pro rata basis (two working days per month). Your holiday entitlement is set out in your employment contract. If a collective agreement applies to your employment relationship, the amount of holiday to which you are entitled is usually higher.", lawyer_id: 9)
q9.answers.create(content: "Your employer is required to give you a written employment contract no later than 1 month after the start of the employment relationship. You and the employer both sign the employment contract. Even if a contract has been concluded orally, your employer must give you a written document setting out the main terms of the contract no later than 1 month after the start of the employment relationship. The employer must sign the document setting out the terms of the contract.", lawyer_id: 9)
q10.answers.create(content: "Yes, the European Preservation Order and the European Production Order made this mandatory and they are legally binding.", lawyer_id: 10)

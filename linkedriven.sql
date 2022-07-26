-- Questão 1:

SELECT u.* FROM users u 
JOIN cities c ON "cityId"=c.id 
WHERE c.name='Rio de Janeiro';

-- Questão 2:

SELECT t.id AS id, u1.name AS writer,
u2.name AS recipient, message
FROM testimonials t
JOIN users u1 ON t."writerId" = u1.id
JOIN users u2 ON t."recipientId" = u2.id;

-- Questão 3:

SELECT e."userId" AS id, u.name, c.name AS course, 
s.name AS school, "endDate" 
FROM educations e
JOIN users u ON e."userId" = u.id
JOIN courses c ON c.id = e."courseId"
JOIN schools s ON s.id = e."schoolId"
WHERE u.id = 30 AND e.status = 'finished';

-- Questão 4:

SELECT e."userId" AS id, u.name, 
r.name AS role,
c.name AS company,
"startDate"
FROM experiences e 
JOIN users u ON u.id = e."userId" 
JOIN roles r ON r.id = e."roleId"
JOIN companies c ON c.id = e."companyId"
WHERE u.id = 50 AND e."endData" IS null;

-- Questão Bônus: 

SELECT schools.id, schools.name AS school, 
courses.name AS course, 
companies.name AS company,
roles.name AS role
FROM applicants
JOIN jobs ON applicants."jobId" = jobs.id
JOIN companies ON jobs."companyId"= companies.id
JOIN roles ON jobs."roleId" = roles.id
JOIN educations ON educations.id = applicants."userId"
JOIN courses ON educations."courseId" = courses.id
JOIN schools ON educations."schoolId" = schools.id
WHERE roles.name = 'Software Engineer' AND jobs.active IS true AND companies.id = 10;

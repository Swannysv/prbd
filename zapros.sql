SELECT 
    `director`.`dirname`, `director`.`facult`
FROM
    `univer008`.`director`
WHERE
    `director`.`facult` = 'ФТП';
    
    SELECT 
    distinct  `student`.`studname` as "имя студента",`student`.`group_#gr` as "группа", `vedomost`.`mark` as "оценка",`subject`.`sabjname` as "предмет"
FROM
 `student`,`vedomost`, `subject`
WHERE
 `vedomost`.`mark` = "5" and `student`.`group_#gr` = "001" and `subject`.`sabjname` = "химия" and `vedomost`.`student_#stud` = `student`.`#stud`=`subject`.`sabjname`;
 
 
SELECT 
    distinct `studname` as 'имя студента',`group_#gr` as 'группа студента', `mark` as 'оценка'
FROM
    `student`, `vedomost`
WHERE
    `vedomost`.`mark` = '5' and  `student`.`group_#gr` = '1.21' and `vedomost`.`student_#stud` = `student`.`#stud`;
    


 
    
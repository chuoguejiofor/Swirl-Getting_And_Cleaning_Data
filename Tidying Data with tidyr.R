library(tidyr)
students
?gather
gather(students, sex, count, -grade)
students2
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(res,sex_class,c("sex", "class"))
students2 %>%
  gather( sex_class, count,-grade ) %>%
  separate( sex_class, c("sex", "class")) %>%
  print
students3
students3 %>%
  gather( class, grade, class1:class5 , na.rm= TRUE) %>%
  print
?spread
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread( test, grade) %>%
  print
library(readr)
parse_number("class5")
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class = parse_number(class)) %>%
  print
students4
student_info <- students4 %>%
  select(id ,name ,sex ) %>%
  print
student_info <- students4 %>%
  select(id, name, sex) %>%
  unique %>%
  print
gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print
passed
failed
passed <- mutate(passed, status="passed")
failed <- mutate(failed, status="failed")
?bind_rows
bind_rows(passed, failed)
sat
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  print1
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count / total
  ) %>% print

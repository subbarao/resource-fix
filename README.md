This project has 3 branches

1.solution1
2.solution2
3.solution3

below files are used in all 3 solutions

app/assets/javascripts/angular_app.coffee

app/assets/javascripts/angular/services/post.coffee

spec/javascripts/angular/services/post_spec.coffee

Running tests
rake db:migrate
bundle exec guard -i

solution1
decroates angular $resource factory and adds new method
$saveOrUpdate
to handle new/existing records


solution2
decroates angular $resource factory and overrides
$save
to handle new/existing records


solution3
adds new factory bgResource

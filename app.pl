#!/usr/bin/env perl
use Mojolicious::Lite;

my $a = 0;
my $b = 0;

any ['GET', 'POST'] => '/' => sub {
  my $c = shift;
  if( my $vote = $c->param('vote') ) {
    if( $vote eq 'a' ) {
      $a++;
    } elsif( $vote eq 'b' ) {
      $b++;
    }
  }
  $c->render(template => 'votes', a => $a, b => $b );
};

app->start;

__DATA__

@@ votes.html.ep
<!DOCTYPE html>
<html>
  <head><title>Voting App</title></head>
  <link rel='stylesheet' href="/style.css" />
<body>
  <div class="outer-container">
  <div class="inner-container">
  <div id="voting-area">
    <form action="" method="POST">
      <div class="a"><%= $a %>
      <button class="a" name="vote" value="a">vote!</button>
      </div>
      vs.
      <div class="b"><%= $b %>
      <button class="b" name="vote" value="b">vote!</button>
      </div>
    </form>
  </div>
  </div>
  </div>
</body>
</html>


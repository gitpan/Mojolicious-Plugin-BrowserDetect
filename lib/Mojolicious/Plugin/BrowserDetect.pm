package Mojolicious::Plugin::BrowserDetect;

# ABSTRACT: HTTP::BrowserDetect integration for Mojolicious

use base 'Mojolicious::Plugin';

use HTTP::BrowserDetect;


sub register {
    my ($self, $app, $conf) = @_;

    my $browser;
    $app->hook(
        before_dispatch => sub {
            my ($c) = @_;
            $browser = HTTP::BrowserDetect->new(
                $c->req->headers->user_agent,
            );
        },
    );

    $app->helper(browser => sub { $browser });
}

1;



__END__
=pod

=head1 NAME

Mojolicious::Plugin::BrowserDetect - HTTP::BrowserDetect integration for Mojolicious

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  # in your Mojolicious controller
  $self->browser->...

  # e. g. in your root/index action
  if ($self->browser->mobile) {
      return $self->redirect_to('/mobile');
  }

=head1 DESCRIPTION

This Mojolicious plugin integrates L<HTTP::BrowserDetect>.

=head1 SEE ALSO

L<HTTP::BrowserDetect>

=head1 AUTHOR

Uwe Voelker <uwe@uwevoelker.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Uwe Voelker.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


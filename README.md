# The-Atheists-Who-Believe-In-God
In the summer of 2007, 21% of self-proclaimed atheists claim to also believe in God.

You may read the final novel [here](atheists.md). Each section of the novel talks about a different atheist. There are 99 different atheists in my dataset, but to expand the novel's length, I anaylzed those 99 atheists **twice**, thereby producing 198.

# Documentation
-To run the program, type
```bundle install
ruby runner.rb

The program will generate a file ("atheists.md"). You can generate a different novel by changing the RNG seed in runner.rb.

-evaluate_data.rb is in charge of converting the survey data into text and categories (turning machine-readable data into human-readable data).
-speech_template.rb then assembles the human-readable data into sentences previously written by me. These sentences are then "joined" together into paragraphs. While speech_template.rb only generate stories based on a single template/structure, it should not be hard to create different templates and have the computer choose between them.
-names.rb generates fake names, based on whether the atheist claims to be male and female.

The only data that is fake (other than the randomly-generated names by names.rb) is the name and details of the "fake faiths" that the atheists believe in. The "fake faith" is randomly determined in runner.rb.

It is highly recommended to view speech_template.rb in a text editor that supports wordwrap.

## Pew Forum's Disclaimer
While the **code** is licensed under the MIT, the dataset itself is under a far more restrictive license, hence the following disclaimer.

The data used for this novel was gathered by the Pew Forum on Religion & Public Life in the summer of 2007, and released to the [general public in 2008](http://www.pewforum.org/datasets/u-s-religious-landscape-survey/). Pew Research does not endorse any cause, candidate, issue, party, product, business or religion, and this novel does not imply any such endorsement. Pew Research is the sole and exclusive owner of all right, title and interest in the Data.

As a part of the dataset's Term and Conditions, this generated novel may not be commerically redistributed without the permission of Pew Research.

This novel has been generated for educational/research purposes only.

Formal Citation:
Pew Forum on Religion & Public Life. *U.S. Religious Landscape Survey*. Pew Research Center. 25 February 2008. Web.
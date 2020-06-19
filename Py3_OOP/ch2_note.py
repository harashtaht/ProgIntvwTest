import datetime

# Store the next available id for all new notes
last_id = 0

class Note:
    '''Represent a note in the notebook. Match against a string in searches and store tags for each note.'''

    def __init__ (self, memo, tags= ''):
        '''initialize a note with memo and optional space-separated tags.
        Automatically set the note's creation date and a unique id.'''
        self.memo = memo
        self.tags = tags
        self.creation_date = datetime.date.today()
        global last_id
        last_id += 1
        self.id = last_id

    def match(self, filter):
        '''Determine if this note matches the filter text.
        Return True if it matches, False otherwise.

        Search is case sensitive and matches both text and tags.'''
        return filter in self.memo or filter in self.tags

from notebook import Note

n1 = Note("hello first")
n2 = Note("hello again")

print(n1.id)
print(n1.match('hello'))
print(n2.id)
print(n2.match('again'))
# print(n1.match('wow'))
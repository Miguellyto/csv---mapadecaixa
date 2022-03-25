from tkinter import Tk, Text, Button, WORD, END, messagebox
class New_Toplevel:
    def __init__(self, top=None): 
        Button(top, text='OK', command=self.clicou).pack()
        self.Text1 = Text(top)
        self.Text1.place(relx=0.017, rely=0.133, relheight=0.831, 
                              relwidth=0.94)
        self.Text1.configure(background="white")
        self.Text1.configure(font="TkTextFont")
        self.Text1.configure(foreground="black")
        self.Text1.configure(highlightbackground="#d9d9d9")
        self.Text1.configure(highlightcolor="black")
        self.Text1.configure(insertbackground="black")
        self.Text1.configure(selectbackground="#c4c4c4")
        self.Text1.configure(selectforeground="black")
        self.Text1.configure(width=564)
        self.Text1.configure(wrap=WORD)

    def clicou(self):
        texto = self.Text1.get(1.0, END)
        with open('arquivo.txt', 'w') as f:
            f.write(texto)
        messagebox.showinfo(title='Conteúdo', message='O texto contém: ' + texto)

root = Tk()
root.geometry('500x500')    
t = New_Toplevel(root)
root.mainloop()

# class App:
#     # 'what' and 'why' should probably be fetched in a different way, suitable to the app
#     def __init__(self, parent, what, why):
#         self.parent = parent
#         self.parent.title(why)
#         self.label = Label(self.parent, text=what)
#         self.label.pack()
#         self.entry = Entry(self.parent)
#         self.entry.pack()
#         self.button = Button(parent, text='OK', command=self.use_entry)
#         self.button.pack()
#     def use_entry(self):
#         contents = self.entry.get()
#         # do stuff with contents
#         self.parent.destroy() # if you must

# root = Tk()
# app = App(root, what, why)
# root.mainloop()
.PHONY: all clean

CMD:=poetry run
ANSIBLE_PLAYBOOK_ENTRYPOINT:=config.yml

all: lint

lint: 
	$(CMD) ansible-playbook  --syntax-check $(ANSIBLE_PLAYBOOK_ENTRYPOINT)
	$(CMD) yamllint -sc .yamllint.yml .
	$(CMD) ansible-lint $(ANSIBLE_PLAYBOOK_ENTRYPOINT)

clean:
	git clean -Xdf # Delete all files in .gitignore
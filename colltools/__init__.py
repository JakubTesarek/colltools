def batch(iterable, step):
    if not isinstance(step, int):
        raise TypeError(f'Step has to be an integer. {type(step)} given.')
    if step <= 0:
        raise IndexError(f'Step has to be larger than 0, {step} given.')
    items = []
    for i in iterable:
        items.append(i) 
        if len(items) == step:
            yield items
            items = []
    if items:
        yield items
